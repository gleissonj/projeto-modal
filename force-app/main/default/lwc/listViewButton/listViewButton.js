import { LightningElement, track } from 'lwc';
import getContato from '@salesforce/apex/ContactController.GetContato';

export default class ListViewButton extends LightningElement {
    @track isLoading = false;
    @track data;

    // Simulate data loading
    handleLoadData() {
        this.isLoading = true;
        this.data = null;
              GetContato().then((result) => {
            this.apontamentos = result;
            this.enableView = true;
            this.error = undefined;
           // this.showToast();
            this.isLoading = false;
        })
            .catch((error) => {
                this.error = error;
                console.log("error", this.error.body)
                console.log("error2", this.error.body.message)
                this.apontamentos = undefined;
                this.enableView = true;
                this.isLoading = false;
            });
    }
    // @track isLoading = false;
    // @track isModalOpen = true;
    
    // apontamentos;
    // error;
    // enableView = false;
    // handleClick(event) {
    //     alert("bateu")
    // }

    // GetContato() {
        
    //     GetContato().then((result) => {
    //         this.apontamentos = result;
    //         this.enableView = true;
    //         this.error = undefined;
    //        // this.showToast();
    //         this.isLoading = false;
    //     })
    //         .catch((error) => {
    //             this.error = error;
    //             console.log("error", this.error.body)
    //             console.log("error2", this.error.body.message)
    //             this.apontamentos = undefined;
    //             this.enableView = true;
    //             this.isLoading = false;
    //         });
    // }

}