FROM node:20-bookworm-slim

# 1. Enable Corepack (manages Yarn/PNPM versions)
RUN corepack enable

# 2. Set working directory
WORKDIR /app

# 3. Copy dependency files first (for caching)
COPY package.json yarn.lock ./

# 4. Install dependencies via Yarn
RUN yarn install --frozen-lockfile

# 5. Copy the rest of the app
COPY . .

# 6. Build the app
RUN yarn build

# 7. expose port
EXPOSE 5173

# 8. Optional: command to run your app
 CMD ["yarn", "start"]
