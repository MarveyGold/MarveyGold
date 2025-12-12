FROM node:20-bookworm-slim

# 1. Enable Corepack
RUN corepack enable

# 2. Set working directory
WORKDIR /app

# 3. Copy only dependency files first (for caching)
COPY package.json yarn.lock ./

# 4. Install dependencies
RUN yarn install --frozen-lockfile

# 5. Copy the rest of the code
COPY . .

# 6. Build
RUN yarn build
