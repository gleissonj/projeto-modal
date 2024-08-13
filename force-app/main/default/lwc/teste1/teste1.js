import { LightningElement, track, api} from 'lwc';
import getApontamento from '@salesforce/apex/ApontamentoController.getApontamento';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Teste1 extends LightningElement { @track isLoading = false;
    @track isModalOpen = true;
    _apontamentos;
    error;
    enableView = false;

    @api
    get apontamentos(){
        return this._apontamentos;
    }

    set apontamentos(value){
        this._apontamentos = value ? [...value] : [];
    }

    @api
    getApontamentoCadastrais() {
        this.isLoading = true;
        getApontamento().then((result) => {
            this._apontamentos = result;
            this.enableView = true;
            this.error = undefined;
            this.showToast();
            this.isLoading = false;
        })
            .catch((error) => {
                this.error = error;
                console.log("error", this.error.body)
                console.log("error2", this.error.body.message)
                this._apontamentos = undefined;
                this.enableView = true;
                this.isLoading = false;
            });
    }

    showToast(message, variant, title) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

    refreshPage() {
        // Reloads the entire page
        window.location.reload();
    }

    closeModal() {
        this.isModalOpen = false;
    }
}