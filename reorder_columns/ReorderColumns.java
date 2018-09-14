import java.io.*;

public class ReorderColumns {

    static final String DELIMITER = ",";

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

                bufferedWriter.write(splits[1] + DELIMITER + splits[0]);
                bufferedWriter.newLine();

            }

            fileReader.close();
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
