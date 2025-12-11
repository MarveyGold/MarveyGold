FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy only package files first for caching
COPY package.json yarn.lock ./

# Use Corepack to enable Yarn (no global npm installs)
RUN corepack enable && corepack prepare yarn@stable --activate

# Install deps using lockfile
RUN yarn install --frozen-lockfile

# Copy the rest of the source
COPY . .

# Build the site
RUN yarn build

# If your app needs a runtime, change the CMD accordingly.
# For SvelteKit on Vercel-like providers you may not need this, but for a generic container:
CMD ["yarn", "preview"]
