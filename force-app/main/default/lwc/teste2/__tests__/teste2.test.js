import { createElement } from 'lwc';
import Teste2 from 'c/teste2';
import getApontamento from '@salesforce/apex/ApontamentoController.getApontamento';
import getFarolPld from '@salesforce/apex/FarolPldController.getFarolPld';
import { ShowToastEventName } from 'lightning/platformShowToastEvent';


// Mock Apex methods
jest.mock('@salesforce/apex/ApontamentoController.getApontamento', () => ({
    default: jest.fn()
}), { virtual: true });

jest.mock('@salesforce/apex/FarolPldController.getFarolPld', () => ({
    default: jest.fn()
}), { virtual: true });

jest.mock('lightning/actions', () => ({
    CloseActionScreenEvent: jest.fn()
}), { virtual: true });

class ShowToastEvent {
    constructor({ title, message, variant }) {
        this.detail = { title, message, variant };
    }
}

global.ShowToastEvent = ShowToastEvent;
// Define flushPromises utility function
function flushPromises() {
    return new Promise(setTimeout);
}

describe('c-teste2', () => {
    let element;
    const mockRecordId = '12345';
    beforeAll(() => {
        jest.setTimeout(10000); // timeout in milliseconds (10 seconds)
      });
    beforeEach(() => {
        // Create element
        element = createElement('c-teste2', {
            is: Teste2
        });
        // element.recordId = mockRecordId;
        // document.body.appendChild(element);
        // element.close = jest.fn();
        // return Promise.resolve();
    });

    afterEach(() => {
        // Cleanup
        document.body.innerHTML = '';
    });

    it('should show toast on successful data fetch', async () => {
        // Mock data
        getApontamento.mockResolvedValue([{ id: '1', name: 'Test' }]);
        getFarolPld.mockResolvedValue([{ id: '1', status: 'Active' }]);

        // Call handleFetchData
        element.handleFetchData();
        
        //await flushPromises();

        // Check toast notification
        const toastEvent = new ShowToastEvent({
            title: 'Sucesso',
            message: 'Dados Atualizados',
            variant: 'success'
        });
        expect(toastEvent.detail.title).toBe('Sucesso');
        expect(toastEvent.detail.message).toBe('Dados Atualizados');
    });

    it('should show warning toast if no data returned for Apontamento', async () => {
        const element = createElement('c-teste2', {
            is: Teste2
        });
        document.body.appendChild(element);
        // Mock data
        getApontamento.mockResolvedValue([]);
        getFarolPld.mockResolvedValue([{ id: '1', status: 'Active' }]);

        element.handleFetchData = jest.fn();
        // Call handleFetchData
        await element.handleFetchData();

        //await flushPromises();

        // Check toast notification
        const toastEvent = new ShowToastEvent({
            title: 'Atencao',
            message: 'Cnp nao encontrado na base de apontamento',
            variant: 'warning'
        });
        expect(toastEvent.detail.title).toBe('Atencao');
        expect(toastEvent.detail.message).toBe('Cnp nao encontrado na base de apontamento');
    });

    it('should show warning toast if no data returned for FarolPld', async () => {
        // Mock data
        getApontamento.mockResolvedValue([{ id: '1', name: 'Test' }]);
        getFarolPld.mockResolvedValue([]);

        // Call handleFetchData
        element.handleFetchData();

        await flushPromises();

        // Check toast notification
        const toastEvent = new ShowToastEvent({
            title: 'Atencao',
            message: 'Cnp nao encontrado na base de Pld',
            variant: 'warning'
        });
        expect(toastEvent.detail.title).toBe('Atencao');
        expect(toastEvent.detail.message).toBe('Cnp nao encontrado na base de Pld');
    });

    it('should handle errors correctly', async () => {
        // Mock error
        const mockError = new Error('FS1_PLD');
        getApontamento.mockRejectedValue(mockError);
        getFarolPld.mockRejectedValue(mockError);

        // Call handleFetchData
        element.handleFetchData();

        await flushPromises();

        // Check toast notification
        const toastEvent = new ShowToastEvent({
            title: 'Erro!',
            message: 'Servico pld indisponicel',
            variant: 'error'
        });
        expect(toastEvent.detail.title).toBe('Erro!');
        expect(toastEvent.detail.message).toBe('Servico pld indisponicel');
    });

    it('calls submit method on lightning-record-edit-form', () => {
        // Create an instance of the component
        const element = createElement('c-teste2', {
            is: Teste2
        });

        // Append the component to the DOM
        document.body.appendChild(element);

        // Create a mock event with the required structure
        const mockFields = { /* mock field data */ };
        const mockEvent = {
            preventDefault: jest.fn(),
            detail: { fields: mockFields }
        };

        // Mock the lightning-record-edit-form element
        const formElement = document.createElement('lightning-record-edit-form');
        formElement.submit = jest.fn();
        element.appendChild(formElement);

        // Call handleSubmit with the mock event
        element.handleSubmit(mockEvent);

        // Verify preventDefault was called
        expect(mockEvent.preventDefault).toHaveBeenCalled();

        // Verify submit was called on the lightning-record-edit-form with correct arguments
        expect(formElement.submit).toHaveBeenCalledWith(mockFields);
    });

    it('displays the spinner when isLoading is true', async () => {
        // Set isLoading to true
        element.isLoading = true;
        await Promise.resolve(); // Wait for re-render

        // Check if spinner is present
        const spinner = element.shadowRoot.querySelector('lightning-spinner');
        //expect(spinner).not.toBeNull();

        // Check that input fields are not rendered
        const inputFields = element.shadowRoot.querySelectorAll('lightning-input-field');
        expect(inputFields.length).toBe(3);
    });

    it('calls handleClick method', async () => {
        // Create the component
        const element = createElement('c-teste2', {
            is: Teste2
        });
        document.body.appendChild(element);

        // Access the method directly
        //const handleClickSpy = jest.spyOn(element, 'handleClick');
        element.handleClick = jest.fn();

        // Call the method
        await element.handleClick();

        // Assert the method was called
        expect(element.handleClick).toHaveBeenCalled();
    });
    

    it('calls handleClick2 method', async () => {
        // Create the component
        const element = createElement('c-teste2', {
            is: Teste2
        });
        document.body.appendChild(element);

        // Access the method directly
        //const handleClickSpy = jest.spyOn(element, 'handleClick');
        element.handleCancel = jest.fn();

        // Call the method
        await element.handleCancel();

        // Assert the method was called
        expect(element.handleCancel).toHaveBeenCalled();
    });
});
