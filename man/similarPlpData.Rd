% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ApplyPlp.R
\name{similarPlpData}
\alias{similarPlpData}
\title{Extract new plpData using plpModel settings
use metadata in plpModel to extract similar data and population for new databases:}
\usage{
similarPlpData(plpModel = NULL, createCohorts = T, newConnectionDetails,
  newCdmDatabaseSchema = NULL, newCohortDatabaseSchema = NULL,
  newCohortTable = NULL, newCohortId = NULL,
  newOutcomeDatabaseSchema = NULL, newOutcomeTable = NULL,
  newOutcomeId = NULL, newOracleTempSchema = newCdmDatabaseSchema,
  sample = NULL, createPopulation = T)
}
\arguments{
\item{plpModel}{The trained PatientLevelPrediction model or object returned by runPlp()}

\item{createCohorts}{Create the tables for the target and outcome - requires sql in the plpModel object}

\item{newConnectionDetails}{The connectionDetails for the new database}

\item{newCdmDatabaseSchema}{The database schema for the new CDM database}

\item{newCohortDatabaseSchema}{The database schema where the cohort table is stored}

\item{newCohortTable}{The table name of the cohort table}

\item{newCohortId}{The cohort_definition_id for the cohort of at risk people}

\item{newOutcomeDatabaseSchema}{The database schema where the outcome table is stored}

\item{newOutcomeTable}{The table name of the outcome table}

\item{newOutcomeId}{The cohort_definition_id for the outcome}

\item{newOracleTempSchema}{The temp coracle schema}

\item{sample}{The number of people to sample (default is NULL meaning use all data)}

\item{createPopulation}{Whether to create the study population as well}
}
\description{
Extract new plpData using plpModel settings
use metadata in plpModel to extract similar data and population for new databases:
}
\examples{
\dontrun{
# set the connection
connectionDetails <- DatabaseConnector::createConnectionDetails()
   
# load the model and data
plpModel <- loadPlpModel("C:/plpmodel")

# extract the new data in the 'newData.dbo' schema using the model settings 
newDataList <- similarPlpData(plpModel=plpModel, 
                              newConnectionDetails = connectionDetails,
                              newCdmDatabaseSchema = 'newData.dbo',
                              newCohortDatabaseSchema = 'newData.dbo',   
                              newCohortTable = 'cohort', 
                              newCohortId = 1, 
                              newOutcomeDatabaseSchema = 'newData.dbo', 
                              newOutcomeTable = 'outcome',     
                              newOutcomeId = 2)    
               
# get the prediction:
prediction <- applyModel(newDataList$population, newDataList$plpData, plpModel)$prediction
}
}
