## About The Project

Lunch and Learn is a back-end application designed to facilitate the search for cuisines by country and provide an opportunity to learn more about that country's culture. Users can search for recipes by country, favorite recipes, and delve deeper into a particular country's cultural background.

The back end application is an API built with the Rails framework. It exposes 12 RESTful endpoints and is responsible for receiving JSON requests, querying the internal database, consuming external APIs, and formatting JSON responses to send data to the front end application.

The application is built with a service-oriented architecture, allowing the front-end to communicate with the back-end through an API.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Learning Goals
- Expose an API that aggregates data from multiple external APIs.
- Expose an API that requires an authentication token.
- Implement Basic Authentication.
- Expose an API for CRUD functionality.
- Determine completion criteria based on the needs of other developers.
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

### Technical Stack
- Language: Ruby
- Framework: Ruby on Rails

### Setup
1. Clone this repo `git@github.com:jcjurado3/lunch_and_learn.git`
1. Navigate to the local repository: `cd lunch_and_learn`
1. Run: `bundle install`
1. Run: `rails db:{create,migrate}`
1. Run: `bundle exec figaro install`
1. Add `EDAMAM_API_KEY`,  `EDAMAM_APP_ID`, `YOUTUBE_API_KEY`, `UNSPLASH_API_KEY` to `config/application.yml` file
1. Run: `rails s` to start Rails server
1. Visit: http://localhost:3000/

### API Key Setup
To fully utilize the application, you'll need to obtain API keys from:
1. REST Countries API [here](https://restcountries.com/#api-endpoints-v3-all)
1. Edamam Recipe API [here](https://developer.edamam.com/edamam-recipe-api)
1. YouTube API [here](https://developers.google.com/youtube/v3/getting-started)
1. Unsplash API [here](https://unsplash.com/developers)

# Testing

`bundle exec rspec` will run the entire test suite. *All tests passing at time of writing.*
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Endpoints
<details>
<summary>GET <code>/api/v1/recipes?country=''</code></summary>
<br>

    {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
        },
    ]
}


</details>
<br>
<details>
<summary>GET <code>/api/v1/learning_resources?country=''</code></summary>
<br>

    {
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples landmark during daytime",
                    "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "five brown wooden boats",
                    "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "orange temples during daytime",
                    "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                },
              ]
        }
    }
}

</details>
<br>
<details>
<summary>POST <code>/api/v1/users</code></summary>
<br>

    {
      "data": {
        "type": "user",
        "id": "1",
        "attributes": {
          "name": "Odell",
          "email": "goodboy@ruffruff.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
      }
    }


</details>
<br>
<details>
<summary>POST<code>/api/v1/sessions</code></summary>
<br>

    {
      "data": {
        "type": "user",
        "id": "1",
        "attributes": {
          "name": "Odell",
          "email": "goodboy@ruffruff.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
      }
    }


</details>
<br>

<details>
<summary>POST<code>/api/v1/favorites</code></summary>
<br>

    {
        "success": "Favorite added successfully"
    }

</details>
<br>

<details>
<summary>GET <code>/api/v1/favorites?api_key=jgn983hy48thw9begh98h4539h4''</code></summary>
<br>

    {
      "data": [
          {
              "id": "1",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Recipe: Egyptian Tomato Soup",
                  "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                  "country": "egypt",
                  "created_at": "2022-11-02T02:17:54.111Z"
              }
          },
          {
              "id": "2",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "country": "thailand",
                  "created_at": "2022-11-07T03:44:08.917Z"
              }
          }
      ]
  }


</details>
<br>


