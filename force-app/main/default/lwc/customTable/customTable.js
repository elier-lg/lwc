import LightningDatatable from 'lightning/datatable';
import imageTableComponent from './imageTableComponent.html';

export default class CustomTable extends LightningDatatable {
  static customTypes = {
    image: {
        template: imageTableComponent
    }
};

}