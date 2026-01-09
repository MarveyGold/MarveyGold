FROM node:20-bookworm-slim

# 1. Enable Corepack
RUN corepack enable

# 2. Optionally ensure Yarn is installed (skip if already present)
RUN if ! command -v yarn > /dev/null; then corepack prepare yarn@stable --activate; fi

# 3. Set working directory
WORKDIR /app

# 4. Copy dependency files first (for caching)
COPY package.json yarn.lock ./

# 5. Install dependencies
RUN yarn install --frozen-lockfile

# 6. Copy the rest of the app
COPY . .

# 7. Build the app
RUN yarn build

# expose port if your app serves content
 EXPOSE 5173

# default command
CMD ["yarn", "start"]
