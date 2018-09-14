import java.io.*;

public class FilterColumns {

    static final String DELIMITER = ",";
    static final Long MIN_VALUE = 400L;

	public static void main(String[] args) {
        String line;

		try {

            // Reader
			File input = new File(args[1]);
			FileReader fileReader = new FileReader(input);
			BufferedReader bufferedReader = new BufferedReader(fileReader);

            // Writer
            File output = new File(args[2]);
            FileOutputStream fileOutputStream = new FileOutputStream(output);
            BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(fileOutputStream));

            boolean isHeader = true;
			while ((line = bufferedReader.readLine()) != null) {

			    String[] splits = line.split(DELIMITER);

                if (isHeader) {
                    bufferedWriter.write(line);
                    bufferedWriter.newLine();
                    isHeader = false;
                    continue;
                }

                if (Long.valueOf(splits[1]) >= MIN_VALUE) {
                    bufferedWriter.write(line);
                    bufferedWriter.newLine();
                }
			}

			fileReader.close();
			bufferedWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
