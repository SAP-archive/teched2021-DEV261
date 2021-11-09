# Use the capbuilder for the first stage build
FROM {your-docker-account}/capui5tools as capbuild
# Create app directory, in which the CAP service is built
WORKDIR /app
# Set to production mode
ENV NODE_ENV=production
# Copy source
COPY . .
# build app
RUN ["cds", "build"]
# Switch to db build
WORKDIR /app/gen/db
# Install db dependencies
RUN npm install
# Run build
CMD [ "npm", "start", "--", "--exit" ]