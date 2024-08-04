import { LightningElement } from 'lwc';
import findAccList from '@salesforce/apex/AccController.findAccList';

export default class SearchDataOnboarding extends LightningElement {
    searchKey = '';
    accounts;

    error;

    handleonchange(event) {
        this.searchKey = event.target.value;
    }

    handleclik() {
        findAccList({ keyword: this.searchKey }).then((result) => {
            this.accounts = result;
            this.error = undefined;
        })
            .catch((error) => {
                this.error = error;
                this.accounts = undefined;
            });
    }
}