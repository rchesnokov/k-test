const digitPosition = (price) => {
    if (isNaN(+price) || price <= 0)
        return
        
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "\xa0")
}

export { digitPosition }