import { LightningElement , track, api} from 'lwc';
import getApontamento from '@salesforce/apex/ApontamentoController.getApontamento';
import getFarolPld from '@salesforce/apex/FarolPldController.getFarolPld';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';



export default class Teste2 extends LightningElement {
    @track datOne;
    @track dataTwo;
    apontamentos;
    pld;
    errorApontamento;
    errorPld;
    enableMsgView;
    isLoading;
    @track steps = [];

    @api recordId;

    @api
    handleFetchData(){
        this.isloading = false;
        Promise.all([
            getApontamento({apontamentoId: this.recordId}),
            getFarolPld({apontamentoId: this.recordId})
        ])
            .then((results) => {
                const [resultOne, resultTwo] = results
                this.datOne = resultOne;
                this.dataTwo = resultTwo;
                if(results[0].length === 0){
                    this.refreshPage();
                    this.handleCancel();
                    return this.ShowToast('Cnp nao encontrado na base de apontamento', 'warning', 'Atencao')
                }
                else if(results[1].length === 0){
                    this.refreshPage();
                    this.handleCancel();
                    return this.showToast('Cnp nao encontrado na base de Pld', 'warning', 'Atencao')
                }
                
                this.refreshPage();
                this.handleCancel();
                return this.showToast('Dados Atualizados', 'success', 'Sucesso');
                
            })
            .catch((error) => {
                this.error = error;
                this.isLoading = false;
                this.handleCancel();
                if (this.error.body.stackTrace.includes('FS1_PLD')){
                    this.showToast('Servico pld indisponicel', 'error', 'Erro!');
                    this.refreshPage();
                }
                else{
                    this.showToast('Servico apontamento indisponicel', 'error', 'Erro!');
                    this.refreshPage();
                }
            })
            .finally(()=> {
                this.isLoading = false;
            });
        
    }

    @api
    showToast(message, variant, title){

        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }

    
    handleCancel(){
        const event = new CustomEvent('closeactionscreen', {
            bubbles: true,
            composed: true,
        });
        this.dispatchEvent(event);
    }

    @api
    connectedCallback(){
        this.steps = [
            {
                id: '9999',
                group: 'exat brasil',
                accounts: '2'
            }
        ]
    }

    @api
    handleSubmit(event){
        event.preventDefault();
        const fields = event.detail.fields;
        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

    @api
    refreshPage(){
        setTimeout(()=>{
            window.location.reload();
        }, 3000);
    }



}