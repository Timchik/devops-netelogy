#!/usr/bin/python

# Copyright: (c) 2018, Terry Jones <terry.jones@example.org>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
from __future__ import (absolute_import, division, print_function)
from pathlib import Path
__metaclass__ = type

DOCUMENTATION = r'''
---
module: my_own_module

short_description: This module creates a text file

# If this is part of a collection, you need to use semantic versioning,
# i.e. the version is of the form "2.5.0" and not "2.4".
description: This module creates a text file on the remote host using the specified path and content.

options:
    path:
        description: Path to write file 
        required: true
        type: str
    content:
        description: File content
        required: true
        type: str
# Specify this value according to your collection
# in format of namespace.collection.doc_fragment_name
# extends_documentation_fragment:
#    - my_namespace.my_collection.my_doc_fragment_name
# Specify this value according to your collection
# in format of namespace.collection.doc_fragment_name


author:
    - Yagudin Timur
'''



RETURN = r'''
# These are examples of possible return values, and in general should use other names for return values.
# These are examples of possible return values, and in general should use other names for return values.
message:
    description: The output message that the test module generates.
    type: str
    returned: always
    sample: 'File create'
'''

from ansible.module_utils.basic import AnsibleModule


def run_module():
    # define available arguments/parameters a user can pass to the module
    module_args = dict(
        path=dict(type='str', required=True),
        content=dict(type='str', required=False, default=False)
    )

    # seed the result dict in the object
    # we primarily care about changed and state
    # changed is if this module effectively modified the target
    # state will include any data that you want your module to pass back
    # for consumption, for example, in a subsequent task
    result = dict(
        changed=False,
        original_message='',
        message=''
    )

    # the AnsibleModule object will be our abstraction working with Ansible
    # this includes instantiation, a couple of common attr would be the
    # args/params passed to the execution, as well as if the module
    # supports check mode
    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    # if the user is working with this module in only check mode we do not
    # want to make any changes to the environment, just return the current
    # state with no modifications
    if module.check_mode:
        module.exit_json(**result)

    # manipulate or modify the state as needed (this is going to be the
    # part where your module will do what it needs to do)
    result['original_message'] = module.params['path']
    result['message'] = 'File exist'
    if Path(module.params['path']).is_file():
	    module.exit_json(**result)
   
   
    FILE = open(module.params['path'],"w")

    # Write all the lines at once:
    FILE.writelines(module.params['content'])

    # Close
    FILE.close()

    # use whatever logic you need to determine whether or not this module
    # made any modifications to your target
    if module.params['path']:
        result['changed'] = True
        result['message'] = 'File create'

    # during the execution of the module, if there is an exception or a
    # conditional state that effectively causes a failure, run
    # AnsibleModule.fail_json() to pass in the message and the result
    #if module.params['path'] == module.params['path']:
    #    module.fail_json(msg='You requested this to fail', **result)

    # in the event of a successful module execution, you will want to
    # simple AnsibleModule.exit_json(), passing the key/value results
    module.exit_json(**result)


def main():
    run_module()


if __name__ == '__main__':
    main()
