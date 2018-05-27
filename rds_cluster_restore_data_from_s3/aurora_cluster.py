#!/usr/bin/python

import boto3
import logging
import json
import botocore
import time
import sys
import jmespath
import argparse


def main(CLUSTER_IDENTIFIER,DB_CLUSTER_PARAMETER_GROUP_NAME,DB_SUBNET_GROUP_NAME,VPC_SECURITY_GROUPS_IDS,SOURCE_ENGINE,SOURCE_ENGINE_VERSION,AURORA_ENGINE,MASTER_USERNAME,MASTER_PASSWORD,STORAGE_ENCRYPETED,KMS_KEY_ID,ENABLE_IAM_DB_AUTHENTICATION,S3_BKP_BUCKET_NAME,S3_BUCKET_PREFIX,S3_INGESTION_ROLE_NAME,RESTORED_DB_NAME):
    client = boto3.client('rds')
    try:

        response = client.restore_db_cluster_from_s3(
            DatabaseName=RESTORED_DB_NAME,
            DBClusterIdentifier=CLUSTER_IDENTIFIER,
            DBClusterParameterGroupName=DB_CLUSTER_PARAMETER_GROUP_NAME,
            VpcSecurityGroupIds=[
                VPC_SECURITY_GROUPS_IDS
            ],
            DBSubnetGroupName=DB_SUBNET_GROUP_NAME,
            Engine=AURORA_ENGINE,
            EngineVersion='',
            Port=3306,
            MasterUsername='restore',
            MasterUserPassword='restore!',
            Tags=[
            {
                'Key': 'string',
                'Value': 'string'
            },
            ],
            StorageEncrypted=STORAGE_ENCRYPETED,
            EnableIAMDatabaseAuthentication=ENABLE_IAM_DB_AUTHENTICATION,
            SourceEngine=SOURCE_ENGINE,
            SourceEngineVersion=SOURCE_ENGINE_VERSION,
            S3BucketName=S3_BKP_BUCKET_NAME,
            S3Prefix=S3_BUCKET_PREFIX,
            S3IngestionRoleArn=S3_INGESTION_ROLE_NAME)
        print response
        running = True
        print "======================================="
        while running:
            cluster_response = client.describe_db_clusters(DBClusterIdentifier=CLUSTER_IDENTIFIER)

            aurora_clusters = cluster_response['DBClusters']
            if len(aurora_clusters) != 1:
                raise Exception('Something Wrong! More than one Aurora Cluster returned.')
            aurora_cluster = aurora_clusters[0]
            aurora_cluster_status = aurora_cluster['Status']
            #print "Current Aurora Cluster status: %s" %(aurora_cluster_status)
            sys.stdout.write("Current Aurora Cluster status: %s\r" %(aurora_cluster_status))
            sys.stdout.flush()
            time.sleep(5)
            if aurora_cluster_status == 'available':
                aurora_cluster_identifier = aurora_cluster['DBClusterIdentifier']
                aurora_endpoint = aurora_cluster['Endpoint']

                print "Aurora Cluster [%s] with endpoint [%s] is ready to get instances attached to it." %(aurora_cluster_identifier,aurora_endpoint)
                print "==============================================="
                print cluster_response
                time.sleep(60)
                running = False
    except botocore.exceptions.ClientError as e:
        if 'DBClusterAlreadyExistsFault' in e.message:
            print "Aurora Cluster %s exists already, Please cross check....." %CLUSTER_IDENTIFIER
        else:
            raise


if __name__ == '__main__':

    try:
     # Instantiate the parser
       parser = argparse.ArgumentParser(description='A360 Standby Deployment')
       parser.add_argument('--cluster_identifier',help='Please enter the cluster identifier.', required=True)
       parser.add_argument('--db_cluster_parameter_group_name',help='Enter DB Cluster Parameter Group Name',required=True)
       parser.add_argument('--db_subnet_group_name',help='Enter DB subnet group name',required=True)
       parser.add_argument('--vpc_security_groups_ids',help='Enter VPC security Group ids',required=True)
       parser.add_argument('--source_engine',help='Enter Source Engine',required=True, default='mysql')
       parser.add_argument('--source_engine_version',help='Enter Source Engine Version',required=True, default='5.6.26')
       parser.add_argument('--aurora_engine',help='Enter Aurora Engine',required=True, default='aurora')
       parser.add_argument('--master_username',help='Enter Master user name',required=True)
       parser.add_argument('--master_password',help='Enter master password',required=True)
       parser.add_argument('--storage_encrypted',help='Enter Storage encrypted value.default false', default=False)
       parser.add_argument('--kms_key_id',help='Enter KMS key id')
       parser.add_argument('--enable_iam_db_authentication',help='Enter boolean value for iam db authentication.',default=False)
       parser.add_argument('--s3_bkp_bucket_name',help='Enter S3 backup bucket name',required=True)
       parser.add_argument('--s3_bucket_prefix',help='Enter S3 bucket prefix',required=True)
       parser.add_argument('--s3_ingestion_role_name',help='Enter Role Name',required=True)
       parser.add_argument('--restore_db_name',help='Enter Restore DB name',required=True)

       #Adding arguments
       args = parser.parse_args()
       print args
       cluster_identifier = args.cluster_identifier
       db_cluster_parameter_group_name = args.db_cluster_parameter_group_name
       db_subnet_group_name = args.db_subnet_group_name
       vpc_security_groups_ids = args.vpc_security_groups_ids
       source_engine = args.source_engine
       source_engine_version = args.source_engine_version
       aurora_engine = args.aurora_engine
       master_username = args.master_username
       master_password = args.master_password
       storage_encrypted = bool(args.storage_encrypted)
       print type(storage_encrypted)
       kms_key_id = args.kms_key_id
       enable_iam_db_authentication = args.enable_iam_db_authentication
       s3_bkp_bucket_name = args.s3_bkp_bucket_name
       s3_bucket_prefix = args.s3_bucket_prefix
       s3_ingestion_role_name = args.s3_ingestion_role_name
       restore_db_name = args.restore_db_name
       main(cluster_identifier,db_cluster_parameter_group_name,db_subnet_group_name,vpc_security_groups_ids,source_engine,source_engine_version,
       aurora_engine,master_username,master_password,storage_encrypted,kms_key_id,enable_iam_db_authentication,s3_bkp_bucket_name,s3_bucket_prefix,s3_ingestion_role_name,restore_db_name)

    except ValueError as e:
       logging.error(e)
       print e
