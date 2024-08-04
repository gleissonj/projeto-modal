import { LightningElement } from 'lwc';
import getFarolPld from '@salesforce/apex/FarolPldController.getFarolPld';

export default class SearchDataPldKyc extends LightningElement {
    pld;
    error;
    getCorFarolPld() {
        getFarolPld().then((result) => {
            this.pld = result;
            this.error = undefined;
        })
            .catch((error) => {
                this.error = error;
                this.pld = undefined
            });
    }
}