@SuppressWarnings({
  "rawtypes", "unchecked"
})
public interface AddressResolver extends Serializable {
	Object resolveAddress(String actorId);
}