
import { LightningElement, wire } from 'lwc';
import getAwwList from '@salesforce/apex/AwwController.getAwwList';

const actions = [
  { label: 'Show details', name: 'show_details' }
];

const columns = [
  {
    type: 'action',
    typeAttributes: {
      rowActions: actions,
      menuAlignment: 'left'
    }
  },
  { label: 'Author', fieldName: 'author_fullname__c', type: 'text' },
  { label: 'Title', fieldName: 'title__c', type: 'text' },
  { label: 'Thumbnail', fieldName: 'thumbnail__c', type:'image'},
];


export default class AwwList extends LightningElement {
  columns = columns;
  record = {};

  //hanlde context menu
  handleRowActions(event) {
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

  @wire(getAwwList) awwPosts;
}