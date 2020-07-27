# React with Docker

## Build Docker image

```
docker build -f Dockerfile.dev .
docker run -it -p 3000:3000 CONTAINER_ID  (static!)
docker run -it -p 3000:3000 -v /app/node_modules -v ${PWD}:/app -e CHOKIDAR_USEPOLLING=true CONTAINER_ID
docker build -f Dockerfile.dev .  (get container id)
docker run -it <container-id> npm run test

// Test Step (Solution1)
--> add another App.js Test..
docker-compose up
--> open another terminal! disadvantage: you have to remember the container-id!
docker ps
docker exec -it <container-id> npm run test
//  Test Step (Solution2)
// add a tests section, see in docker-compose.yml
// disadvantage: no interaction, also not with docker attach <container-id>

// Prod Build Step
docker build .
docker run -p 8080:80 <container-id>

// Cleanup Step
docker images
docker image rm -f <container-id>
```

## V1 fix https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/learn/lecture/18562132#overview
```
version: '3'
services:
  web:
    stdin_open: true
    build: .
    ports:
      - "3000:3000"
    volumes:
      - /app/node_modules
      - .:/app
```


## V2 if Dockerfile diffrent like Dockerfile.dev use..
```
version: '3'
services:
  web:
    stdin_open: true
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
    volumes:
      - /app/node_modules
      - .:/app
```

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `yarn start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `yarn build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `yarn eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: https://facebook.github.io/create-react-app/docs/code-splitting

### Analyzing the Bundle Size

This section has moved here: https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size

### Making a Progressive Web App

This section has moved here: https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app

### Advanced Configuration

This section has moved here: https://facebook.github.io/create-react-app/docs/advanced-configuration

### Deployment

This section has moved here: https://facebook.github.io/create-react-app/docs/deployment

### `yarn build` fails to minify

This section has moved here: https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify



