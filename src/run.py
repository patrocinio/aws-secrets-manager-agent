from botocore.exceptions import ClientError

import botocore 
import botocore.session 
from aws_secretsmanager_caching import SecretCache, SecretCacheConfig 

from flask import Flask

app = Flask(__name__)

region_name = "us-east-1"

client = botocore.session.get_session().create_client('secretsmanager')
cache_config = SecretCacheConfig()
cache = SecretCache( config = cache_config, client = client)

def get_secret(secret_name):
    try:
        secret = cache.get_secret_string(secret_name)
    except ClientError as e:
        # For a list of exceptions thrown, see
        # https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
        print ("Exception: ", e)
        raise e

    return secret

@app.route("/<secret_name>")
def run(secret_name):
    secret = get_secret(secret_name)
    print ("Secret: ", secret)
    return secret
