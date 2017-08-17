import riot from 'riot';

const URL = 'https://rawgit.com/Varinetz/e6cbadec972e76a340c41a65fcc2a6b3/raw/90191826a3bac2ff0761040ed1d95c59f14eaf26/frontend_test_table.json'

class Store {
    constructor () {
        riot.observable(this)

        this.items = []

        this.registerEvents()
        this.requestData()
    }

    registerEvents () {
        this.on('app_init', this.initialize)
        this.on('add_item', this.addItem)
        this.on('remove_item', this.removeItem)
    }
    
    requestData () {
        fetch(URL, { mode: 'cors' })
            .then(response => processResponse(response))
            .then(json => {
                this.items = json
                this.trigger('app_ready')
                this.trigger('data_changed', this.items)
            })
            .catch(err => { console.log('Error: ', err); alert('Error retrieving data)')})
        
        function processResponse (response) {
            if(response.ok) {
                return response.json()
            }
            throw new Error('Network error')
        }
    }

    removeItem (index) {
        this.items.splice(index, 1)
        this.trigger('data_changed', this.items)
    }

    addItem (data) {
        data.price = +data.price.replace(/\s/g, '')
        data.year = +data.year
        data.id = this.getUniqueId()

        this.items.push(data)
        this.trigger('data_changed', this.items)
    }

    getUniqueId () {
        let i = 1, 
            newID;

        const IDs = this.items
            .map(item => +item.id)
            .sort(compareNumbers)
        
        for (let lenght = IDs.length; i < lenght; i++) {
            if (IDs.indexOf(i) === -1) {
                newID = i;
                break;
            }
        } 

        return newID ? newID : i + 1;

        function compareNumbers (a, b) {
            return a - b;
        }
    }

}

export default Store