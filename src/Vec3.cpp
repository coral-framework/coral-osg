#include "Vec3_Adapter.h"

namespace coOsg
{
	double Vec3_Adapter::getX( coOsg::Vec3& instance )
	{
		return instance.x();
	}

	void Vec3_Adapter::setX( coOsg::Vec3& instance, double value )
	{
		instance.x() = value;
	}

	double Vec3_Adapter::getY( coOsg::Vec3& instance )
	{
		return instance.y();
	}

	void Vec3_Adapter::setY( coOsg::Vec3& instance, double value )
	{
		instance.y() = value;
	}

	double Vec3_Adapter::getZ( coOsg::Vec3& instance )
	{
		return instance.z();
	}

	void Vec3_Adapter::setZ( coOsg::Vec3& instance, double value )
	{
		instance.z() = value;
	}

	void Vec3_Adapter::add( coOsg::Vec3& instance, const coOsg::Vec3& other )
	{
		instance += other;
	}

	void Vec3_Adapter::cross( coOsg::Vec3& instance, const coOsg::Vec3& other )
	{
		instance = instance ^ other;
	}

	void Vec3_Adapter::divScalar( coOsg::Vec3& instance, double scalar )
	{
		instance /= scalar;
	}

	void Vec3_Adapter::dot( coOsg::Vec3& instance, const coOsg::Vec3& other, double& result )
	{
		result = instance * other;
	}

	void Vec3_Adapter::equals( coOsg::Vec3& instance, const coOsg::Vec3& other, bool& isEqual )
	{
		isEqual = instance == other;
	}

	void Vec3_Adapter::length( coOsg::Vec3& instance, double& length )
	{
		length = instance.length();
	}

	void Vec3_Adapter::mulScalar( coOsg::Vec3& instance, double scalar )
	{
		instance *= scalar;
	}

	void Vec3_Adapter::normalize( coOsg::Vec3& instance )
	{
		instance.normalize();
	}

	void Vec3_Adapter::sub( coOsg::Vec3& instance, const coOsg::Vec3& other )
	{
		instance -= other;
	}
} // namespace coOsg
