'''
Custom Library For Robot Framework Workshop
'''
import json

import requests


class WorkshopLibrary:
    '''Contains methods for the WorkshopLibrary'''
    
    def __init__(self):
        self.base_url = 'http://localhost:5000'

    def submit_name(self, first_name, last_name):
        '''
        Performs a POST request to the /robotframework endpoint with the given first + lastname.
        Returns a string with the output.
        '''
        endpoint = '/robotframework'
        data = {
            'firstName': first_name,
            'lastName': last_name
        }
        response = requests.post(url=f'{self.base_url}{endpoint}', data=data) 
        response_dict = json.loads(response.text)
        return response_dict['output']