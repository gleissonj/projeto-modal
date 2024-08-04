import { LightningElement } from 'lwc';
import getApontamento from '@salesforce/apex/ApontamentoController.getApontamento';

export default class SearchApontamento extends LightningElement {
    apontamentos;
    error;

    getApontamentoCadastrais() {
        getApontamento().then((result) => {
            this.apontamentos = result;
            this.error = undefined;
        })
            .catch((error) => {
                this.error = error;
                this.apontamentos = undefined
            });
    }
}