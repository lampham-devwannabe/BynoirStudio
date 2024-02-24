package dal;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class GenericDAO<T> extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;
    protected Map<String, Object> parameterMap;
    public static final boolean CONDITION_AND = true;
    public static final boolean CONDITION_OR = false;

    protected List<T> queryGenericDAO(Class<T> clazz) {
        List<T> result = new ArrayList<>();
        try {
            connection = getConnection();
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT * FROM ").append(clazz.getSimpleName());
            statement = connection.prepareStatement(sqlBuilder.toString());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                T obj = mapRow(resultSet, clazz);
                result.add(obj);
            }
            return result;
        } catch (IllegalAccessException
                | IllegalArgumentException
                | InstantiationException
                | NoSuchMethodException
                | InvocationTargetException
                | SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) {
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                System.err.println("SQLException: " + e.getMessage());
            }
        }
        return result;
    }

    protected List<T> queryGenericDAO(Class<T> clazz, String sql, Map<String, Object> parameterHashmap) {
        List<T> result = new ArrayList<>();
        try {
            connection = getConnection();
            List<Object> parameters = new ArrayList<>();
            if (parameterHashmap != null && !parameterHashmap.isEmpty()) {
                for (Map.Entry<String, Object> entry : parameterHashmap.entrySet()) {
                    Object conditionValue = entry.getValue();
                    parameters.add(conditionValue);
                }
            }
            statement = connection.prepareStatement(sql);
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                T obj = mapRow(resultSet, clazz);
                result.add(obj);
            }
            return result;
        } catch (IllegalAccessException
                | IllegalArgumentException
                | InstantiationException
                | NoSuchMethodException
                | InvocationTargetException
                | SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) {
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.err.println("SQLException: " + e.getMessage());
            }
        }
        return result;
    }

    private static <T> T mapRow(ResultSet rs, Class<T> clazz) throws
            SQLException,
            NoSuchMethodException,
            InstantiationException,
            IllegalArgumentException,
            IllegalAccessException,
            InvocationTargetException {
        T obj = clazz.getDeclaredConstructor().newInstance();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            Object value = getFieldValue(rs, field);
            field.setAccessible(true);
            field.set(obj, value);
        }
        return obj;
    }

    private static Object getFieldValue(ResultSet rs, Field field) throws SQLException {
        Class<?> fieldType = field.getType();
        String fieldName = field.getName();
        if (fieldType == String.class) {
            return rs.getString(fieldName);
        } else if (fieldType == int.class || fieldType == Integer.class) {
            return rs.getInt(fieldName);
        } else if (fieldType == long.class || fieldType == Long.class) {
            return rs.getLong(fieldName);
        } else if (fieldType == double.class || fieldType == Double.class) {
            return rs.getDouble(fieldName);
        } else if (fieldType == boolean.class || fieldType == Boolean.class) {
            return rs.getBoolean(fieldName);
        } else if (fieldType == float.class || fieldType == Float.class) {
            return rs.getFloat(fieldName);
        } else {
            return rs.getObject(fieldName);
        }
    }

    protected boolean updateGenericDAO(String sql, Map<String, Object> parameterMap) {
        List<Object> parameters = new ArrayList<>();
        for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
            Object conditionValue = entry.getValue();
            parameters.add(conditionValue);
        }
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }
            statement.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                System.err.println("SQLException: " + ex.getMessage());
            }
            return false;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                System.err.println("SQLException: " + e.getMessage());
            }
        }
    }

    protected boolean deleteGenericDAO(String sql, Map<String, Object> parameterMap) {
        List<Object> parameters = new ArrayList<>();
        for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
            Object conditionValue = entry.getValue();
            parameters.add(conditionValue);
        }
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql);
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }
            statement.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                System.err.println("SQLException: " + ex.getMessage());
            }
            return false;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                System.err.println("SQLException: " + e.getMessage());
            }
        }
    }

    protected int insertGenericDAO(T object) {
        Class<?> clazz = object.getClass();

        Field[] fields = clazz.getDeclaredFields();
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder.append("INSERT INTO ").append(clazz.getSimpleName()).append(" (");
        List<Object> parameters = new ArrayList<>();
        for (Field field : fields) {
            field.setAccessible(true);
            String fieldName = field.getName();
            Object fieldValue;
            try {
                fieldValue = field.get(object);
            } catch (IllegalAccessException e) {
                fieldValue = null;
            }
            if (fieldValue != null && !fieldName.equalsIgnoreCase("id")) {
                sqlBuilder.append(fieldName).append(", ");
                parameters.add(fieldValue);
            }
        }
        if (sqlBuilder.charAt(sqlBuilder.length() - 2) == ',') {
            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length());
        }
        sqlBuilder.append(") VALUES (");
        for (int i = 0; i < parameters.size(); i++) {
            sqlBuilder.append("?, ");
        }
        if (sqlBuilder.charAt(sqlBuilder.length() - 2) == ',') {
            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length());
        }
        sqlBuilder.append(")");
        connection = getConnection();
        int id = 0;
        try {
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sqlBuilder.toString(), Statement.RETURN_GENERATED_KEYS);
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            System.err.println("insertGenericDAO: " + sqlBuilder.toString());
            connection.commit();
        } catch (SQLException e) {
            try {
                System.err.println("SQLException: " + e.getMessage());
                connection.rollback();
            } catch (SQLException ex) {
                System.err.println("SQLException: " + ex.getMessage());
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                System.err.println("SQLException: " + e.getMessage());
            }
        }
        return id;
    }

    protected int insertGenericDAO(String sql, Map<String, Object> parameterMap) {
        List<Object> parameters = new ArrayList<>();
        for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
            Object conditionValue = entry.getValue();
            parameters.add(conditionValue);
        }
        connection = getConnection();
        int id = 0;
        try {
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            connection.commit();
        } catch (SQLException e) {
            try {
                System.err.println("SQLException: " + e.getMessage());
                connection.rollback();
            } catch (SQLException ex) {
                System.err.println("SQLException: " + ex.getMessage());
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                System.err.println("SQLException: " + e.getMessage());
            }
        }
        return id;
    }

    protected int findTotalRecordGenericDAO(Class<T> clazz) {
        int total = 0;
        try {
            connection = getConnection();
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT COUNT(*) FROM ").append(clazz.getSimpleName());
            List<Object> parameters = new ArrayList<>();
            statement = connection.prepareStatement(sqlBuilder.toString());
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                total = resultSet.getInt(1);
            }
        } catch (IllegalArgumentException | SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) {
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.err.println("SQLException: " + e.getMessage());
            }
        }
        return total;
    }

    protected int findTotalRecordGenericDAO(Class<T> clazz, String sql, Map<String, Object> parameterMap) {
        int total = 0;
        try {
            connection = getConnection();
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT COUNT(*) FROM ").append(clazz.getSimpleName());
            List<Object> parameters = new ArrayList<>();
            if (parameterMap != null && !parameterMap.isEmpty()) {
                for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
                    Object conditionValue = entry.getValue();
                    parameters.add(conditionValue);
                }
            }
            statement = connection.prepareStatement(sql);
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                total = resultSet.getInt(1);
            }
        } catch (IllegalArgumentException | SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) {
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.err.println("SQLException: " + e.getMessage()
                );
            }
        }
        return total;
    }

    public abstract List<T> findAll();

    public abstract int insert(T t);

}
