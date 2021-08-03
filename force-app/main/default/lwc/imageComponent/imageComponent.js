import { LightningElement, api } from 'lwc';

export default class ImageComponent extends LightningElement {
  @api url;
  @api altText;
}