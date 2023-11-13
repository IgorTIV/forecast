// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.querySelector("#weather").addEventListener("submit", function(e){
  location.href = this.action + '/' +document.querySelector('#zip_code').value
  e.preventDefault();
});
