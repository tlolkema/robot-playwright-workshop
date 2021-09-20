'''
Custom Library For Robot Framework Workshop
'''
import json

import requests


class PythonLibrary:
    '''Contains methods for the PythonLibrary'''
    
    def __init__(self):
        self.base_url = 'http://localhost:5000'
    
    def get_frameworks(self):
        '''
        Performs a GET request to the /frameworks endpoint.
        Returns the JSON output.
        '''
        endpoint = '/frameworks'
        response = requests.get(url=f'{self.base_url}{endpoint}') 
        response_dict = json.loads(response.text)
        return response_dict

    def post_signup(self, first_name, last_name):
        '''
        Performs a POST request to the /signup endpoint with the given first + lastname.
        Returns the JSON output.
        '''
        endpoint = '/signup'
        data = {
            'firstName': first_name,
            'lastName': last_name
        }
        response = requests.post(url=f'{self.base_url}{endpoint}', data=data) 
        response_dict = json.loads(response.text)
        return response_dict
