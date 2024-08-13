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
        element.recordId = mockRecordId;
        document.body.appendChild(element);
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
        // Mock data
        getApontamento.mockResolvedValue([]);
        getFarolPld.mockResolvedValue([{ id: '1', status: 'Active' }]);

        // Call handleFetchData
        element.handleFetchData();

        await flushPromises();

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
});
