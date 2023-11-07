import { LightningElement ,api, wire, track} from 'lwc';
import getContactList from '@salesforce/apex/ContactHelper.getContactList';
export default class LightningDatatableLWCExample extends LightningElement {
    @track columns = [{
            label: 'First Name',
            fieldName: 'FirstName',
            type: 'text',
            sortable: true
        },
        {
            label: 'Last Name',
            fieldName: 'LastName',
            type: 'text',
            sortable: true
        },
        {
            label: 'Email',
            fieldName: 'Email',
            type: 'text',
            sortable: true
        }
    ];
 
    @track error;
    @track conList ;
    @wire(getContactList)
    wiredContacts({
        error,
        data
    }) {
        if (data) {
            this.conList = data;
        } else if (error) {
            this.error = error;
        }
    }
}
