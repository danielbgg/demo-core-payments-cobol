       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYPROC.
       AUTHOR. DEMO-POC.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAY-IN ASSIGN TO PAYIN.
           SELECT PAY-OUT ASSIGN TO PAYOUT.
           SELECT PAY-ERROR ASSIGN TO PAYERR.

       DATA DIVISION.
       FILE SECTION.
       FD  PAY-IN.
       01  PAY-IN-RECORD                PIC X(80).
       FD  PAY-OUT.
       01  PAY-OUT-RECORD               PIC X(80).
       FD  PAY-ERROR.
       01  PAY-ERROR-RECORD             PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-END-OF-FILE               PIC X VALUE 'N'.
           88  END-OF-PAYMENTS          VALUE 'Y'.
       01  WS-VALID                     PIC X VALUE 'N'.
       COPY PAYREC.
       COPY CLIENTE.
       COPY STATUS.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM INITIALIZE-FILES
           PERFORM PROCESS-PAYMENTS UNTIL END-OF-PAYMENTS
           PERFORM CLOSE-FILES
           GOBACK.

       INITIALIZE-FILES.
           OPEN INPUT PAY-IN
                OUTPUT PAY-OUT
                OUTPUT PAY-ERROR.

       PROCESS-PAYMENTS.
           READ PAY-IN
               AT END
                   MOVE 'Y' TO WS-END-OF-FILE
               NOT AT END
                   MOVE PAY-IN-RECORD TO PAYMENT-RECORD
                   PERFORM VALIDATE-AND-ROUTE
           END-READ.

       VALIDATE-AND-ROUTE.
           MOVE 'Y' TO WS-VALID
           CALL 'PAYVAL' USING WS-VALID
           IF WS-VALID = 'Y'
               MOVE STATUS-APPROVED TO PAY-STATUS
               MOVE PAYMENT-RECORD TO PAY-OUT-RECORD
               WRITE PAY-OUT-RECORD
           ELSE
               MOVE PAYMENT-RECORD TO PAY-ERROR-RECORD
               WRITE PAY-ERROR-RECORD
           END-IF.

       CLOSE-FILES.
           CLOSE PAY-IN PAY-OUT PAY-ERROR.
