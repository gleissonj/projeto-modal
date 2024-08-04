import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import getAccList from '@salesforce/apex/AccController.getAccList';
import findAccList from '@salesforce/apex/AccController.findAccList';

export default class Hu7SendOnboarding extends LightningElement {
    @api recordId;
    @api objectApiName;


    searchKey = '';

    //    @wire(getAccList) accounts;

    accounts;
    error;
    handleSuccess(e) {
        // Close the modal window and display a success toast
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Opportunity Record Updated!',
                variant: 'success'
            })
        );
    }

    saveTeste() {
        getAccList().then((result) => {
            this.accounts = result;
            this.error = undefined;
        })
            .catch((error) => {
                this.error = error;
                this.accounts = undefined
            });
    }
}