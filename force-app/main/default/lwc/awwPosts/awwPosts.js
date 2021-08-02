
import { LightningElement, wire } from 'lwc';
import getAwwList from '@salesforce/apex/AwwController.getAwwList';

const columns = [
  {label: 'Author', fieldName: 'author_fullname__c', type: 'text'},
  {label: 'Title', fieldName: 'title__c', type: 'text'},
  {label: 'Thumbnail', fieldName: 'thumbnail__c', type: 'url'}
];

const actions = [
  { label: 'Show details', name: 'show_details' }
];

export default class AwwList extends LightningElement {
  columns = columns;
  actions = actions;
  record = {};

  //hanlde context menu
  handleRowAction(event) {
    const actionName = event.detail.action.name;
    const row = event.detail.row;
    switch (actionName) {
        case 'show_details':
            this.showRowDetails(row);
            break;
        default:
    }
}

  //assign value to selected record
  showRowDetails(row) {
    this.record = row;
  }

  @wire(getAwwList)awwPosts;
}