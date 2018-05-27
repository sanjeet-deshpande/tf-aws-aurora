require 'rubygems'
require 'bundler'
require 'rake'
require 'English'

def youre_behind?
  `git fetch >/dev/null 2>&1`
  behind = `git log ..origin/master --oneline`.split("\n").length > 0
  raise unless $CHILD_STATUS.exitstatus.zero?
  return behind
end

def youre_behind!
  if youre_behind?
    raise "ERROR: You're out of sync with the remote! Try 'git pull --rebase'"
  end
end

def current_version
  File.read('VERSION').strip
end

def bump(component)
  puts '------- Bumping version ----------'
  youre_behind!
  version = current_version

  # update the version
  new_version = nil
  chunks = version.split('.')

  if component == :patch
    chunks[-1] = (chunks.last.to_i + 1).to_s
  elsif component == :minor
    chunks[-2] = (chunks[-2].to_i + 1).to_s
    chunks[-1] = '0'
  else
    chunks[0] = (chunks[0].to_i + 1).to_s
    chunks[-2] = '0'
    chunks[-1] = '0'
  end

  new_version = chunks.join('.')
  File.open('VERSION', 'w') { |f| f.write(new_version) }

  `git add VERSION`
  `git commit -m "Version bump to #{version}"`
  `git tag -a v#{new_version} -m#{new_version}`
  raise 'Could not add tag' unless $CHILD_STATUS.exitstatus.zero?
  puts 'Version is now "%s"' % new_version
end

def release component
  puts '------- Pushing to repo ----------'
  status = system('git push')
  raise 'Push failed' unless status

  status = system('git push --tag')
  raise 'Tag push failed' unless status
end

def gen_tf_docs
  status = system('which terraform-docs > /dev/null')
  unless status
    puts "Can't autogenerate terraform doc - you don't have terraform-docs installed"
    return true
  end
  puts '------- Generating TERRAFORM.md ----------'
  `terraform-docs md rds_cluster_parameter_group > rds_cluster_parameter_group/TERRAFORM.md`
  `terraform-docs md rds_cluster_instance > rds_cluster_instance/TERRAFORM.md`
  `terraform-docs md db_subnet_group > db_subnet_group/TERRAFORM.md`
  `terraform-docs md db_parameter_group > db_parameter_group/TERRAFORM.md`
  `terraform-docs md db_option_group > db_option_group/TERRAFORM.md`
  `terraform-docs md rds_cluster > rds_cluster/TERRAFORM.md`
  `git add rds_cluster_parameter_group/TERRAFORM.md`
  `git add rds_cluster_instance/TERRAFORM.md`
  `git add db_subnet_group/TERRAFORM.md`
  `git add db_parameter_group/TERRAFORM.md`
  `git add db_option_group/TERRAFORM.md`
  `git add rds_cluster/TERRAFORM.md`
  `git commit -m "Updating rds_cluster_parameter_group/TERRAFORM.md and rds_cluster_instance/TERRAFORM.md and db_subnet_group/TERRAFORM.md and db_parameter_group/TERRAFORM.md and db_option_group/TERRAFORM.md and rds_cluster/TERRAFORM.md"`
end

desc 'Print the current version'
task :version do
  puts current_version
end

namespace :docs do
  desc 'Auto generate terraform docs'
  task :default do
    gen_tf_docs
  end
end

namespace :release do
  desc 'Release new major version'
  task :major do
    gen_tf_docs
    bump :major
    release :major
  end

  desc 'Release new minor version'
  task :minor do
    gen_tf_docs
    bump :minor
    release :minor
  end

  task :patch do
    gen_tf_docs
    bump :patch
    release :patch
  end
end

desc 'Release a new patch version'
task release: %w[ release:patch ]
task docs: %w[ docs:default ]
