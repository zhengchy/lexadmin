GO
/****** FHQQ313596790 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE LEX_QUESTIONMESSAGE (
 		QUESTIONMESSAGE_ID  nvarchar(100) NOT NULL,
		LAUNCH_USER_ID nvarchar(100) DEFAULT NULL,
		RECEIVE_USER_ID nvarchar(100) DEFAULT NULL,
		QUESTION_ID nvarchar(100) DEFAULT NULL,
		MESSAGE_TYPE nvarchar(2) DEFAULT NULL,
		MESSAGE_NOTE nvarchar(100) DEFAULT NULL,
		MESSAGE_STATE nvarchar(2) DEFAULT NULL,
		CREATE_TIME nvarchar(32) DEFAULT NULL,
		UPDATE_TIME nvarchar(32) DEFAULT NULL,
		PUSH_STATE int NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QUESTIONMESSAGE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
