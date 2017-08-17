<car-listing>

    <div class="listing">

        <div class="listing__title">
            <h2>Автомобили в наличии</h2>
        </div>

        <div class="listing__table _desktop">
            <table>
                <thead class="listing__head">
                    <tr>
                        <td class="listing__size-title">Название</td>
                        <td>Год</td>
                        <td class="h-ta-c">Цвет</td>
                        <td>Статус</td>
                        <td>Цена</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <tr if={ itemsLength == 0 }>
                        <td class="h-ta-c" colspan="6">Нет данных</td>
                    </tr>
                    <tr each={ items }>
                        <td>
                            <span>{ title }</span><br>
                            <span if={ description } class="listing__property _additional">{ description }</span>
                        </td>
                        <td>
                            { year }
                        </td>
                        <td class="listing__property _color">
                            <span class="color-marker h-c-{ color }"></span>
                        </td>
                        <td>
                            { statusList[status] }
                        </td>
                        <td>
                            { decoratePrice(price) }&nbsp;руб.
                        </td>
                        <td>
                            <a onclick={ parent.remove } class="listing__button" href="javascript:void(0)">Удалить</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <ul class="listing__table _mobile">
            <li each={ items } class="listing__item">
                <table if={ itemsLength == 0 }>
                    <tr>
                        <td class="h-ta-c">Нет данных</td>
                    </tr>
                </table>
                <table>
                    <tbody>
                        <tr>
                            <td class="listing__property _title">{ title }</td>
                            <td class="listing__property _color">
                                <span class="color-marker h-c-{ color }"></span>
                            </td>
                            <td class="listing__property _price h-ta-r">{ decoratePrice(price) }&nbsp;руб.</td>
                        </tr>
                        <tr>
                            <td if={ description } class="listing__property _additional" colspan="3">{ description }</td>
                        </tr>
                        <tr>
                            <td>
                                <span>{ year }</span>
                                <span>{ statusList[status] }</span>    
                            </td>
                            <td></td>
                            <td class="h-ta-r">
                                <a onclick={ parent.remove } class="listing__button" href="javascript:void(0)">Удалить</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </li>
        </ul>

    </div>



    <script type="es6">
        import { digitPosition } from '../../scripts/common/helpers'

        this.items = []
        this.itemsLength = this.items.length

        this.statusList = {
            pednding: 'Ожидается',
            out_of_stock: 'Нет в наличии',
            in_stock: 'В\xa0наличии'
        }
        
        this.decoratePrice = digitPosition

        this.remove = (event) => {
            const item = event.item
            const index = this.items.indexOf(item)
            RiotControl.trigger('remove_item', index)
        }

        RiotControl.on('data_changed', (items) => {
            this.items = items
            this.itemsLength = this.items.length
            this.update()
        })
    </script>    

</car-listing>