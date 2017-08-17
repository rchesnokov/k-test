<car-form>

    <form class="form" action="">
        <div class="form__row">
            <div class="form__field field js-labeled-field">
                <input ref="title" class="field__input input" name="title" type="text">
                <label class="field__label">Название</label>
            </div>
            <div class="form__field field _mobile_half js-labeled-field">
                <input ref="year" class="field__input input" name="year" type="text" data-mask-year>
                <label class="field__label">Год</label>
            </div>
            <div class="form__field field _mobile_half js-labeled-field">
                <input ref="price" class="field__input input" name="price" type="text" data-inputmask="'alias': 'numeric', 'groupSeparator': ' ', 'autoGroup': true, 'allowMinus': false, 'repeat': 8, 'rightAlign': false">
                <label class="field__label">Цена</label>
            </div>
        </div>
        <div class="form__row">
            <div class="form__field field js-labeled-field">
                <input ref="description" class="field__input input" name="description" type="text">
                <label class="field__label">Описание</label>
            </div>
        </div>
        <div class="form__row">
            <div class="form__field color-picker _mobile_indent_small">
                <label class="color-picker__label">Цвет</label>
                <ul ref="color" class="color-picker__list">
                    <li class="color-picker__variant">
                        <input class="color-picker__input" type="radio" id="color-1" name="color" value="white">
                        <label class="color-picker__control _white" for="color-1">
                            <span class="color-marker h-c-white"></span>
                        </label>
                    </li>
                    <li class="color-picker__variant">
                        <input class="color-picker__input" type="radio" id="color-2" name="color" value="black">
                        <label class="color-picker__control" for="color-2">
                            <span class="color-marker h-c-black"></span>
                        </label>
                    </li>
                    <li class="color-picker__variant">
                        <input class="color-picker__input" type="radio" id="color-3" name="color" value="gray">
                        <label class="color-picker__control" for="color-3">
                            <span class="color-marker h-c-gray"></span>
                        </label>
                    </li>
                    <li class="color-picker__variant">
                        <input class="color-picker__input" type="radio" id="color-4" name="color" value="red">
                        <label class="color-picker__control" for="color-4">
                            <span class="color-marker h-c-red"></span>
                        </label>
                    </li>
                    <li class="color-picker__variant">
                        <input class="color-picker__input" type="radio" id="color-5" name="color" value="green">
                        <label class="color-picker__control" for="color-5">
                            <span class="color-marker h-c-green"></span>
                        </label>
                    </li>
                </ul>
            </div>
            <div class="form__field _mobile_half">
                <select ref="status" name="status" data-placeholder="Статус">
                    <option></option>
                    <option value="in_stock">В наличии</option>
                    <option value="pednding">Ожидается</option>
                    <option value="out_of_stock">Нет в наличии</option>
                </select>
            </div>
            <div class="form__field _mobile_half">
                <button onclick={ add } class="button _fullsize" type="submit">
                    <span>Отправить</span> 
                    <i class="button__icon"><img src="./images/arrow_small_right.svg" alt=""></i>
                </button>
            </div>
        </div>
    </form>


    <script type="es6">
        import * as ui from '../../scripts/common/ui'

        this.on('mount', () => {
            ui.inputmask(this.root)
            ui.select(this.root)
            ui.labels(this.root)
        })

        this.add = (event) => {
            event.preventDefault()

            const color = this.refs.color.querySelector('input[type=radio]:checked')
            const data = {
                title: this.refs.title.value,
                year: this.refs.year.value,
                price: this.refs.price.value,
                description: this.refs.description.value,
                color: color != null ? color.value : '',
                status: this.refs.status.value,
            }
            
            const allDataFilled = Object.keys(data)
                .filter(key => key !== 'description')
                .map(key => data[key])
                .indexOf('')
            
            if (allDataFilled != -1) {
                alert('Заполните все поля!')
            } else {
                RiotControl.trigger('add_item', data)
                this.clearForm()
            }
        }

        this.clearForm = () => {
            const inputs = this.root.querySelectorAll('input[type=text]')
            const radio = this.refs.color.querySelector('input[type=radio]:checked')
            const select = this.root.querySelector('select')

            ;[].map.call(inputs, el => { el.value = ''; el.classList.remove('_filled') })
            radio.checked = false
            $(select).val('').trigger('change')
        }
    </script>

</car-form>