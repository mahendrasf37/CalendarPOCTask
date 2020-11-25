import { LightningElement, track } from 'lwc';

import getCalendar from '@salesforce/apex/CalendarAPIPOC.getCalendar';

export default class CalendarAPIPOC extends LightningElement {

    @track calendarData;

    connectedCallback() {

        getCalendar()
        .then(data =>{
            
            //alert(data);
            this.calendarData = data;
        })

    }

}