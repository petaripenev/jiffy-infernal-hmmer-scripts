EPN, Thu Dec 26 07:08:27 2019

Usage of tblout-add.pl:
--
% perl tblout-add.pl 
tblout-add.pl

Usage:
	tblout-add.pl [OPTIONS]
	<tblout file to add to>
	<nexp, number of expected fields (last 'field' may contain whitespace)>
	<add file with data to add, two fields per line>
	<field number [1..nexp] in tblout file that field 1 of add file pertains to>

	OPTIONS:
		-t          : make output tab delimited
		--empty <s> : specify empty value for new field be <s> [default: '-']


--
Example usage of tblout-add.pl:

1. Add sequence length of target sequences to a cmsearch --tblout file:
   my.tblout: --tblout output file from cmsearch
   my.fa:     fasta file used in cmsearch command

   Using esl-seqstat, create the '.seqlen' file with 2 fields
   separated by a single space, first field is target sequence name,
   second is length of the sequence:

   % esl-seqstat -a my.fa | grep ^\= | awk '{ printf("%s %s\n", $2, $3); }' > my.seqlen

   Using tblout-add.pl and the my.seqlen file you just created, add
   seqlen field to my.tblout:

   % perl tblout-add.pl my.tblout 18 my.seqlen 1

   To make that output file tab-delimited use -t, like this:

   % perl tblout-add.pl -t my.tblout 18 my.seqlen 1

--

