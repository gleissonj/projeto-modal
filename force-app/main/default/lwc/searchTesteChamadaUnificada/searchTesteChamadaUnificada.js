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
    @track array1 = ['Alice', 'Bob', 'Charlie'];
    @track array2 = [
        { id: '1', name: 'Alice', age: 30 },
        { id: '2', name: 'Bob', age: 25 },
        { id: '3', name: 'David', age: 35 }
    ];

     array10 = ['apple', 'banana', 'cherry'];
     array20 = ['banana', 'date', 'fig'];

     foundValues ;

    findCommonElements() {
        // Using filter() to find elements in arrayA that are present in arrayB
        const hasCommonElement = this.arrayA.some(itemA => this.arrayB.includes(itemA));
        console.log('Has common element:', hasCommonElement);
        return commonElements;
    }

    getTwoEndpoint(){
        Promise.all([
            getApontamento(),
            getFarolPld()
        ])
        .then((results) => {
            const [resultOne, resultTwo] = results
            this.apontamentos = resultOne;
            this.dataTwo = resultTwo;
            console.log("one", this.apontamentos);
            console.log("two", this.dataTwo);
        })
        .catch((error) => {
            console.log("result", error)
            this.error = error;
        })
        .finally(() => {
            this.isLoading = false;
        });
    }
    
    findMatchingRecords() {
        const matches = this.array2.filter(record => 
            this.array1.includes(record.name)
        );

        if (matches.length > 0) {
            console.log('Matching records:', matches);
        } else {
            console.log('No matching records found');
        }
    }

    connectedCallback() {
        // Call the method to check for matches when the component is loaded
        this.findMatchingRecords();
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

    connectedCallback2() {
        this.findCommonValues2();
    }

    findCommonValues2() {
        this.foundValues = this.array10.filter(item => this.array20.includes(item));
        this.foundValues = JSON.parse(JSON.stringify(this.foundValues))
        console.log("arra", this.array20);
        console.log("teste", this.foundValues )
    }
}