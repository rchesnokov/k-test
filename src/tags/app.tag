<app>
    <div class="container">
        <section class="app">
            <h1 class="app__title">¡Ay caramba!</h1>
            <div class="app__car-form">
                <car-form></car-form>
            </div>
            <div class="app__car-listing">
                <car-listing></car-listing>
            </div>
        </section>
    </div>

    <script type="es6">
        import './components/car-form.tag'
        import './components/car-listing.tag'

        this.on('mount', () => { RiotControl.trigger('app_init') });
    </script>
</app>