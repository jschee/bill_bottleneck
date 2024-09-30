import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit(event) {
    event.preventDefault();

    const form = this.element;
    const formData = new FormData(form);
    const filters = formData.getAll('filter').join(',');
    const params = new URLSearchParams();
    if (filters) {
      params.set('filter', filters);
    }
    form.action = `${form.action.split('?')[0]}?${params.toString()}`;

    form.requestSubmit(); 
  }
}