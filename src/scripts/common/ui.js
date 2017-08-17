import Inputmask from 'inputmask'
import 'select2'

const inputmask = (template) => {
    const inputs = template.querySelectorAll('input[data-inputmask]');
    const yearInputs = template.querySelectorAll('input[data-mask-year]')
    const yearOptions = { 
        placeholder: "",
        postValidation: function (buffer, opts) {
            return parseInt(buffer.join('')) <= (new Date()).getFullYear();
        }
    }

    Inputmask().mask(inputs)
    Inputmask("9999", yearOptions).mask(yearInputs)
}

const select = (template) => {
    const selects = template.querySelectorAll('select');
    [].map.call(selects, (el) => {
        $(el).select2({
            minimumResultsForSearch: Infinity,
            placeholder: $(el).data('placeholder')
        });
    })
}

const labels = (template) => {
    const labels = template.querySelectorAll('.js-labeled-field');
    [].map.call(labels, bindInputClass)

    function bindInputClass (el) {
        const input = el.querySelector('input');
        input.addEventListener('change', function (event) {
            if (this.value !== '')
                this.classList.add('_filled')
            else
                this.classList.remove('_filled')
        })
    }
}

export { inputmask, select, labels }