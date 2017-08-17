'use strict'

const path = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const NODE_ENV = process.env.NODE_ENV || 'development';

module.exports = {
    context: path.resolve(__dirname, "src"),
    entry: './scripts/main.js',
    output: {
        filename: './scripts/[name].bundle.js',
        path: path.resolve(__dirname, 'dist'),
        publicPath: './'
    },
    
    module: {
        rules: [
            {
                test: /\.js$/,
                use: [ 'babel-loader' ],
            },
            {
                test: /\.tag$/,
                use: [ 'riot-tag-loader' ],
            },
            {
                test: /\.html$/,
                use: [ 'file-loader?name=[path][name].[ext]', 'extract-loader', 'html-loader' ]
            },
            {
                test: /\.css$/,
                use: [ 'style-loader', 'css-loader' ]
            },
            {
                test: /\.(styl|stylus)$/,
                use: [
                    'style-loader',
                    {
                        loader: 'css-loader',
                        options: {
                            importLoaders: 1
                        }
                    },
                    {
                        loader: 'postcss-loader', 
                        options: {
                            plugins: function () {
                                return [
                                    require('autoprefixer')({ browsers: ['> 1%', 'ie >= 10'] })
                                ];
                            }
                        }
                    },
                    'stylus-loader' 
                ]
            },
            {
                test: /\.(jpg|png|svg)$/i,
                loader: "file-loader?name=[path][name].[ext]",
            },
        ]
    },

    plugins: [
        new webpack.DefinePlugin({
            'process.env': {
                NODE_ENV: JSON.stringify(process.env.NODE_ENV)
            }
        }),
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery'
        })
    ],

    stats: {
        children: false,
    },

    devtool: process.env.NODE_ENV === "development" ? "source-map" : false,
    devServer: {
        contentBase: path.join(__dirname, "dist"),
    }
};