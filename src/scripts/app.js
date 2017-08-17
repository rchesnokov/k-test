import riot from 'riot'
import riotControl from 'riotcontrol'

import '../tags/app.tag'
import Store from './store'

window.RiotControl = riotControl;

const appStore = new Store()
riotControl.addStore(appStore)
riot.mount('app')