FROM node:20-bookworm-slim

# Enable Corepack to manage Yarn
RUN corepack enable

# Optional: ensure Yarn is available via Corepack
RUN corepack prepare yarn@stable --activate

WORKDIR /app

# Copy dependency files first
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the app
COPY . .

# Build the app
RUN yarn build
