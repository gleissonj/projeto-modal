import { LightningElement, api } from 'lwc';
import uploadFile from '@salesforce/apex/filePreviewAndDownloadController.uploadFile';

export default class FilePreviewAndDownloads extends LightningElement {
    @api
    myRecordId;
    file;

    // EXEMPLO 1
    // get acceptedFormats() {
    //     return ['.pdf', '.png'];
    // }

    // handleUploadFinished(event) {
    //     // Get the list of uploaded files
    //     const uploadedFiles = event.detail.files;
    //     // eslint-disable-next-line no-alert
    //     alert('No. of files uploaded :' + uploadedFiles.length);
        
    // }

    // EXEMPLO 2
    
    handleFileUpload(event) {
        this.file = event.target.files[0];
    }

    uploadFile() {
        if (!this.file) {
        // eslint-disable-next-line no-alert
            return alert('No file selected');
        }
        const reader = new FileReader();
        reader.onload = () => {
            const fileContents = reader.result.split(',')[1];
            const fileName = this.file.name;
            uploadFile({ fileName, fileContents })
                .then(result => {
                    // eslint-disable-next-line no-alert
                    alert('File uploaded successfully', result);
                    // Handle success
                })
                .catch(error => {
                    console.error('Error uploading file: ', error);
                    // Handle error
                });
        };
        reader.readAsDataURL(this.file);
        return true; // Return a consistent value
    }
}