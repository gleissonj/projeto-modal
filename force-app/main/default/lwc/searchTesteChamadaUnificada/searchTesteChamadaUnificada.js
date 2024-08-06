import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getApontamento from '@salesforce/apex/ApontamentoController.getApontamento';
import getFarolPld from '@salesforce/apex/FarolPldController.getFarolPld';

export default class SearchTesteChamadaUnificada extends LightningElement {
    @track isLoading = false;
    @track isModalOpen = true;
    apontamentos;
    error;
    enableView = false;
    @track dataOne;
    @track dataTwo;

    getTwoEndpoint(){
        Promise.all([
            getApontamento(),
            getFarolPld()
        ])
        .then((results) => {
            const [resultOne, resultTwo] = results
            this.dataOne = resultOne;
            this.dataTwo = resultTwo;
            console.log("one", this.dataOne);
            console.log("two", this.dataTwo);
        })
        .catch((error) => {
            this.error = error;
        })
        .finally(() => {
            this.isLoading = false;
        });
    }
    

    getApontamentoCadastrais() {
        this.isLoading = true;
        getApontamento().then((result) => {
            this.apontamentos = result;
            this.enableView = true;
            this.error = undefined;
            this.showToast();
            this.isLoading = false;
        })
            .catch((error) => {
                this.error = error;
                this.apontamentos = undefined;
                this.enableView = true;
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

    refreshPage() {
        // Reloads the entire page
        window.location.reload();
    }

    closeModal() {
        this.isModalOpen = false;
    }
}