import { LightningElement, track } from 'lwc';
import getApontamento from '@salesforce/apex/ApontamentoController.getApontamento';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class SearchApontamento extends LightningElement {
    @track isLoading = false;
    apontamentos;
    error;

    getApontamentoCadastrais() {
        this.isLoading = true;
        getApontamento().then((result) => {
            this.apontamentos = result;
            this.error = undefined;
            this.showToast();
            this.isLoading = false;
        })
            .catch((error) => {
                this.error = error;
                this.apontamentos = undefined;
                this.isLoading = false;
            });
    }

    showToast() {
        const event = new ShowToastEvent({
            title: 'Sucesso!',
            message: 'The operation was completed successfully.',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

    loadData() {
        this.isLoading = true;
        
        // Simulate an async operation (e.g., server call)
        setTimeout(() => {
            // Data loading complete
            this.isLoading = false;
        }, 2000); // Change the delay as needed
    }
}