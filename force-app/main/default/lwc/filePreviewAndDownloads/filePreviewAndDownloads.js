import { LightningElement, api, wire } from 'lwc';
import getRelatedFilesByRecordId from '@salesforce/apex/filePreviewAndDownloadController.getRelatedFilesByRecordId';
import {NavigationMixin} from 'lightning/navigation'  

export default class FilePreviewAndDownloads extends NavigationMixin(LightningElement) {
   @api recordId
   filesList=[]
   @wire(getRelatedFilesByRecordId, {recordId: '$recordId'})
   wiredResult({data, error}){
     if(data){
       console.log('data: ', JSON.stringify(data));
       this.filesList = Object.keys(data).map(item=>({"label":data[item],
        "value": item,
        "url":`/sfc/servlet.shepherd/document/download/${item}`
       }))
       console.log('data: ', JSON.stringify(this.filesList));
     }
     else if(error){
       console.log('error: ', JSON.stringify(error));
     }
   }

   previewHandler(event){
    console.log(event.target.dataset.id)
    this[NavigationMixin.Navigate]({ 
        type:'standard__namedPage',
        attributes:{ 
            pageName:'filePreview'
        },
        state:{ 
            selectedRecordId: event.target.dataset.id
        }
    })
}
}