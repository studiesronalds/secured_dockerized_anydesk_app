import sys
import requests
import json
import base64

# the mock-0.3.1 dir contains testcase.py, testutils.py & mock.py
sys.path.append('/opt/project/bs4')
sys.path.append('/opt/project/netlib')

from pprint import pprint

def start(context = [], argv = []):
    print ('Random Start!')


def request(flow):
    if flow.request.host != 'www.upwork.com':
        flow.request.scheme = 'http'
        flow.request.port = 80
        flow.request.host = 'www.upwork.com'
        flow.request.path = '/'


def response(flow):
    if "text/html" in flow.response.headers["content-type"] and flow.request.host != 'www.upwork.com' :     # inject only for HTML resources
        print ('Has Body') 
        pprint(type(flow.response.content))
        flow.response.content = 'only upwork must be open'
