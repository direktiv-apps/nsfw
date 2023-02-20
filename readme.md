
# nsfw 1.0

Classifiy images NSFW (Not-Safe-For-Work)

---
- #### Categories: misc
- #### Image: gcr.io/direktiv/functions/nsfw 
- #### License: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
- #### Issue Tracking: https://github.com/direktiv-apps/nsfw/issues
- #### URL: https://github.com/direktiv-apps/nsfw
- #### Maintainer: [direktiv.io](https://www.direktiv.io) 
---

## About nsfw

This function takes a alist of images and classifies them. It returns the following categories and their probabilty:

- drawings
- hentai
- neutral
- porn
- sexy

It uses a [Keras/Tensorflow](https://github.com/GantMan/nsfw_model) model with 93% accuracy.

### Example(s)
  #### Function Configuration
```yaml
functions:
- id: nsfw
  image: gcr.io/direktiv/functions/nsfw:1.0
  type: knative-workflow
```
   #### Basic
```yaml
- id: nsfw
  type: action
  action:
    function: nsfw
    input: 
      images:
      - image: /logo.png
```
   #### Advanced
```yaml
- id: nsfw
  type: action
  action:
    function: nsfw
    files:
    - key: myfile.png
      scope: workflow
    input: 
      images:
      - image: myfile.png
  catch:
  - error: '*'
```

   ### Secrets


*No secrets required*







### Request



#### Request Attributes
[PostParamsBody](#post-params-body)

### Response
  List of verified images.
#### Reponse Types
    
  

[PostOKBody](#post-o-k-body)
#### Example Reponses
    
```json
[
  {
    "result": {
      "/logo.png": {
        "drawings": 0.9428686499595642,
        "hentai": 0.006181077565997839,
        "neutral": 0.02313055470585823,
        "porn": 0.012030646204948425,
        "sexy": 0.015789249911904335
      }
    },
    "success": true
  }
]
```

### Errors
| Type | Description
|------|---------|
| io.direktiv.command.error | Command execution failed |
| io.direktiv.output.error | Template error for output generation of the service |
| io.direktiv.ri.error | Can not create information object from request |


### Types
#### <span id="post-o-k-body"></span> postOKBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| nsfw | [][PostOKBodyNsfwItems](#post-o-k-body-nsfw-items)| `[]*PostOKBodyNsfwItems` |  | |  |  |


#### <span id="post-o-k-body-nsfw-items"></span> postOKBodyNsfwItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| result | [interface{}](#interface)| `interface{}` | ✓ | |  |  |
| success | boolean| `bool` | ✓ | |  |  |


#### <span id="post-params-body"></span> postParamsBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| images | [][PostParamsBodyImagesItems](#post-params-body-images-items)| `[]*PostParamsBodyImagesItems` |  | `[{"image":"test.png"}]`| Array of images. |  |


#### <span id="post-params-body-images-items"></span> postParamsBodyImagesItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| image | string| `string` |  | | Image to verify |  |

 
