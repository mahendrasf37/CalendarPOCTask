import { LightningElement , api } from 'lwc';

export default class ChildComponent extends LightningElement {

    @api message;

    @api childComp(name) {
        alert('name alert '+name);
     this.message = name;   


     const event = new CustomEvent('btnclick', {
         detail: {
             key :'8779IGGDKS',
             value:'value is key value'
           }
     });
     this.dispatchEvent(event);
    }
}